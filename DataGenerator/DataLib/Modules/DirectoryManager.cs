using System;
using System.IO;
using Newtonsoft.Json;

namespace DataLib.Modules
{
    
    public class DirectoryManager
    {
        public static string rootPath = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.Parent.FullName;
        private string filePath = string.Concat(rootPath, "/filename.txt");
        public string ReturnPath()
        {
            return filePath;
        }

        public void CreateFiles()
        {

            string data = new string("sdfds\nllsjfd");
            // string stringjson = JsonConvert.SerializeObject(data);

            if (File.Exists(filePath)) 
                File.Delete(filePath);
            using (var streamWriter = new StreamWriter(filePath, true))
            {
                streamWriter.WriteLine(data); //stringjson
                streamWriter.Close();
            }
            
        }

        public string ReadData()
        {
            string jsonConverted = null;
            using (StreamReader r = new StreamReader(filePath))
            {
                jsonConverted = r.ReadToEnd();
                // jsonConverted = JsonConvert.DeserializeObject<String>(json);
            }
            return jsonConverted;
        }

    }

}