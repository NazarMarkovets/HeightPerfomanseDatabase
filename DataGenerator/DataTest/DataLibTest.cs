using Microsoft.VisualStudio.TestTools.UnitTesting;
using DataLib.Modules;
using System.Collections.Generic;
using System.IO;

namespace DataTest
{
    [TestClass]
    public class DataLibTest
    {
        Initialize initialize;
        DirectoryManager directoryManager;
        
        [TestInitialize]
        public void Initialize()
        {
            initialize = new Initialize();
            directoryManager = new DirectoryManager();
        }
        [TestMethod]
        public void Test_compare_database_name()
        {
            initialize.List.AddRange(new object[]{"database", "table", 2});
            List<object> expectedList = initialize.ReturnInitialData();
            string returnString = string.Concat(expectedList[0], ".", expectedList[1]);
            string expectedString = "database.table";
            Assert.IsTrue(returnString == expectedString);
        }
        
        [TestMethod]
        public void Test_CanUseNumber_for_counter()
        {
            initialize.List.AddRange(new object[]{"database", "table", 2});
            List<object> expectedList = initialize.ReturnInitialData();
            
            int expectedNumber = 3;
            int actualNumber = 1+ (int)expectedList.Count-1;
            Assert.AreEqual(expected:expectedNumber, actual:actualNumber);   
        }
        
        [TestMethod]
        public void Test_Return_Path()
        {
            string actualPath = directoryManager.ReturnPath();
            Assert.IsTrue(actualPath.Contains("/DataGenerator/filename.txt"));
        }

        [TestMethod]
        public void Test_CreateData()
        {
            directoryManager.CreateFiles("test");
            var path = directoryManager.ReturnPath();
            Assert.IsTrue(File.Exists(path));
        }

        
        

    }
}
