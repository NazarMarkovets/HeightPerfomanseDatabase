using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace DataLib.Modules
{
    public class DataConverter
    {
        
        public void ConvertUnformatedText(string databaseName, int counterForInserts, string pathToFile)
        {
            if (pathToFile is null)
            {
                throw new System.ArgumentNullException(nameof(pathToFile));
            }
            DirectoryManager directoryManager = new DirectoryManager();
            DataWriter dataWriter = new DataWriter();
            FileReader reader = new FileReader();
            

            //read data from unformated text file
            using (StreamReader sr = new StreamReader(pathToFile))
            {
                var filecontent = sr.ReadToEnd();
                LinkedList<string> lines = new LinkedList<string>(filecontent.Split('\n'));
                LinkedList<string> longLines = new LinkedList<string>();
                
                foreach (var line in lines)
                {
                    if (line.Length > 20)
                    {
                        longLines.AddLast(line.Trim());
                    }
                }

                foreach (var line in longLines)
                {
                    // if (dataWriter.insertedRowsCounter == dataWriter.counter) break;
                    // dataWriter.oneline = line;
                    dataWriter.WriteIntoFile(line, "FormatedText");
                    // dataWriter.WriteIntoFile(line, "Inserts");
                }
                Task.Run(()=>reader.ReadDataFromFileAsync(pathToFile));
            }   
        }

        public void ApplyConvertedDataToInserts(string databaseName, int counterForInserts)
        {
            DirectoryManager directoryManager = new DirectoryManager();
            DataWriter dataWriter = new DataWriter(databaseName,counterForInserts);
            using (StreamReader sr = new StreamReader(directoryManager.ReturnPathToFile()))
            {
                var filecontent = sr.ReadToEnd();
                List<string> lines = new List<string>(filecontent.Split('\n'));
                dataWriter.WriteIntoFile("GeneratedInserts", lines);
            }
        }
    }
}