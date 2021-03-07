using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace DataLib.Modules
{
    public class FileReader
    {
        
        
        public async Task ReadDataFromFileAsync(string path)
        {
            if (!File.Exists(path))
                throw new Exception("File path is wrong");
            string result;
            using (StreamReader reader = new StreamReader(path))
            {
                Console.WriteLine("Opened file.");
                result = await reader.ReadToEndAsync();
                Console.WriteLine("First line contains: " + result);
            }
            
            
        }
            
            
            
        #region OldVersion
        // public void ReadGenaratedData()
        // {
        //     using (StreamReader reader = File.OpenText(@"Dat\GeneratedInserts.txt"))
        //     {
        //         DumpLog(reader);
        //         reader.Close();
        //     }
        // }


        // private static void DumpLog(TextReader streamReader)
        // {
        //     string line;
        //     while ((line = streamReader.ReadLine()) != null)
        //     {
        //         Console.WriteLine(line);
        //     }
        // }
        #endregion
        
    }
}