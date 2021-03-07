using Microsoft.VisualStudio.TestTools.UnitTesting;
using DataLib;
using DataLib.Modules;
using System.Collections.Generic;

namespace DataTest
{
    [TestClass]
    public class DataLibTest
    {
        DataLib.Initialize initialize;
        
        
        [TestInitialize]
        public void Initialize()
        {
            initialize = new Initialize();
        }
        [TestMethod]
        public void TestMethod1()
        {
            initialize.List.AddRange(new object[]{"database", "table", 2});
            List<object> expectedList = initialize.ReturnInitialData();
            string returnString = string.Concat(expectedList[0], ".", expectedList[1]);
            string expectedString = "database.table";
            Assert.IsTrue(returnString == expectedString);
        }
        [TestMethod]
        public void CanUseNumber()
        {
            initialize.List.AddRange(new object[]{"database", "table", 2});
            List<object> expectedList = initialize.ReturnInitialData();
            
            int expectedNumber = 3;
            int actualNumber = 1+ (int)expectedList.Count-1;
            Assert.AreEqual(expected:expectedNumber, actual:actualNumber);   
        }
    }
}
