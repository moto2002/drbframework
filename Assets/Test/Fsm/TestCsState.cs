﻿
using DrbFramework.Fsm;
using UnityEngine;

namespace DrbFramework.Test.Fsm
{
    public class TestCsState : FsmState
    {

        private float m_Time;

        public override void OnEnter(object userData)
        {
            base.OnEnter(userData);

            m_Time = 0f;
            Logger.Log.Info("test csharp state enter");
        }

        public override void OnUpdate(float elapseSeconds, float realElapseSeconds)
        {
            base.OnUpdate(elapseSeconds, realElapseSeconds);

            m_Time += elapseSeconds;
            if (m_Time > 3f)
            {
                ChangeState("TestLuaState");
            }
        }

        public override void OnLeave()
        {
            base.OnLeave();

            Logger.Log.Info("test csharp state leave");
        }
    }
}