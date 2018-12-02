﻿
using DrbFramework.DataTable;
using DrbFramework.Extensions;
using Excel;
using System;
using System.Data;
using System.IO;
using System.Text;

namespace DrbFramework.Internal.DataTable
{
    public class ExcelToBinaryDataTableCreater : IDataTableCreater
    {
        public void CreateDataTable(string dataSourcePath, string outputPath)
        {
            if (string.IsNullOrEmpty(dataSourcePath)) return;
            if (!File.Exists(dataSourcePath)) return;

            FileStream stream = File.Open(dataSourcePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);

            DataSet result = excelReader.AsDataSet();

            string fileName = Path.GetFileNameWithoutExtension(dataSourcePath);
            string[,] dataArr = CreateData(fileName, outputPath, result.Tables[0]);
            CreateCSharpEntity(fileName, outputPath, dataArr);
        }

        private string[,] CreateData(string fileName, string outputPath, System.Data.DataTable dtData)
        {
            byte[] buffer = null;
            string[,] dataArr = null;

            using (MemoryStream ms = new MemoryStream())
            {
                int row = dtData.Rows.Count;
                int columns = dtData.Columns.Count;

                dataArr = new string[columns, 3];

                ms.WriteInt(row - 2);
                ms.WriteInt(columns);

                for (int i = 0; i < 3; ++i)
                {
                    for (int j = 0; j < columns; j++)
                    {
                        dataArr[j, i] = dtData.Rows[i][j].ToString().Trim();
                        if (i == 0)
                        {
                            ms.WriteUTF8String(dtData.Rows[i][j].ToString().Trim());
                        }
                    }
                }

                for (int i = 3; i < row; ++i)
                {
                    for (int j = 0; j < columns; j++)
                    {
                        ms.WriteUTF8String(dtData.Rows[i][j].ToString().Trim());
                    }
                }
                buffer = ms.ToArray();
            }

            outputPath += "/data/";
            if (!Directory.Exists(outputPath))
            {
                Directory.CreateDirectory(outputPath);
            }
            FileStream fs = new FileStream(string.Format("{0}/{1}", outputPath, fileName + ".bytes"), FileMode.Create);
            fs.Write(buffer, 0, buffer.Length);
            fs.Close();

            return dataArr;
        }


        private void CreateCSharpEntity(string fileName, string outputPath, string[,] dataArr)
        {
            if (dataArr == null) return;

            StringBuilder sbr = new StringBuilder();
            sbr.Append("\r\n");
            sbr.Append("//===================================================\r\n");
            sbr.AppendFormat("//Author：{0}\r\n", ConstDefine.Author);
            sbr.AppendFormat("//CreateTime：{0}\r\n", DateTime.Now.ToString());
            sbr.Append("//Remark：This code is generated for the tool\r\n");
            sbr.Append("//===================================================\r\n");
            sbr.Append("\r\n");
            sbr.Append("using DrbFramework.DataTable;\r\n");
            sbr.Append("using DrbFramework.Extensions;\r\n");
            sbr.Append("using System.Collections;\r\n");
            sbr.Append("\r\n");
            sbr.Append("/// <summary>\r\n");
            sbr.AppendFormat("/// {0}实体\r\n", fileName);
            sbr.Append("/// </summary>\r\n");
            sbr.AppendFormat("public partial class {0}DataEntity : IDataEntity\r\n", fileName);
            sbr.Append("{\r\n");

            for (int i = 0; i < dataArr.GetLength(0); i++)
            {
                sbr.Append("    /// <summary>\r\n");
                sbr.AppendFormat("    /// {0}\r\n", dataArr[i, 2]);
                sbr.Append("    /// </summary>\r\n");
                sbr.AppendFormat("    public {0} {1} {{ get; private set; }}\r\n", dataArr[i, 1], dataArr[i, 0]);
                sbr.Append("\r\n");
            }

            sbr.Append("    /// <summary>\r\n");
            sbr.Append("    /// 行数据\r\n");
            sbr.Append("    /// </summary>\r\n");
            sbr.Append("    public IDataRow DataRow { get; private set; }\r\n");
            sbr.Append("\r\n");

            sbr.Append("    public void MakeEntity(IDataRow row)\r\n");
            sbr.Append("    {\r\n");
            for (int i = 0; i < dataArr.GetLength(0); i++)
            {
                sbr.AppendFormat("        {0} = row.GetFieldValue(\"{0}\"){1};\r\n", dataArr[i, 0], ChangeCSharpTypeName(dataArr[i, 1]));
            }
            sbr.Append("        DataRow = row;\r\n");
            sbr.Append("    }\r\n");

            sbr.Append("}\r\n");

            outputPath += "/entity/";
            if (!Directory.Exists(outputPath))
            {
                Directory.CreateDirectory(outputPath);
            }
            using (FileStream fs = new FileStream(string.Format("{0}/{1}DataEntity.cs", outputPath, fileName), FileMode.Create))
            {
                using (StreamWriter sw = new StreamWriter(fs))
                {
                    sw.Write(sbr.ToString());
                }
            }
        }

        private string ChangeCSharpTypeName(string type)
        {
            string str = string.Empty;

            switch (type)
            {
                case "byte":
                    str = ".ToByte()";
                    break;
                case "short":
                    str = ".ToShort()";
                    break;
                case "int":
                    str = ".ToInt()";
                    break;
                case "long":
                    str = ".ToLong()";
                    break;
                case "float":
                    str = ".ToFloat()";
                    break;
                case "bool":
                    str = ".ToBool()";
                    break;
            }

            return str;
        }
    }
}