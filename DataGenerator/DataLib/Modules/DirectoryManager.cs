using System;
using System.IO;
using Newtonsoft.Json;

namespace DataLib.Modules
{
    
    public class DirectoryManager
    {
        //Path to root folder (DataGenerator)
        public static string rootPath = Directory.GetParent(Environment.CurrentDirectory).Parent.Parent.Parent.FullName;
        private string filename;
        private string filePath
        {
            get{return string.Concat(rootPath, $"/GeneratedResult/{filename}.txt");}
            set{filename = value;}
        }
        public string ReturnPath()
        {
            if(filename is null)
                throw new FileLoadException();
            return filePath;
        }

        public void CreateFiles(string fileName)
        {
            this.filePath = fileName;
            Directory.SetCurrentDirectory(rootPath);
            
            if(!Directory.Exists($"{rootPath}/GeneratedResult"))
                Directory.CreateDirectory($"{rootPath}/GeneratedResult");
            
            File.CreateText(filePath);
        }
    }

}