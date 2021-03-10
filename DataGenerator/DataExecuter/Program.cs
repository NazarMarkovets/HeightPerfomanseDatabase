using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DataLib.Modules;

namespace DataExecuter
{
    class Program
    {
        
        private static List<Object> initData = new List<object>();
        static async Task Main()
        {
            Initialize initialize = new Initialize();
            initialize.SetInitialData();
            initData = initialize.ReturnInitialData();
            string database_table = String.Concat(initData[0],".",initData[1]);
            FileReader reader = new FileReader();

            await Task.Run(() => reader.ReadDataFromFileAsync(@"Dat\GeneratedInserts.txt"));
        }
    }
}
