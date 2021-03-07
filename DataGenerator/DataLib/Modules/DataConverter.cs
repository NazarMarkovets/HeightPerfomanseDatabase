using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace DataLib.Modules
{
    public class DataConverter
    {
        
        public void GetOperations(string name, int number)
        {
            
            DataWriter getdata = new DataWriter(name,number);
            FileReader reader = new FileReader();
            // GetUpdates updates = new GetUpdates(name, idColumn, number);
            using (StreamReader sr = new StreamReader(@"Dat\data.txt"))
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
                    if (getdata.insertedRows == getdata.counter) break;
                    getdata.oneline = line;
                    getdata.WriteFormatedText(line);
                    getdata.WriteInsert(line);
                }
            
                Task.Run(()=>reader.ReadDataFromFileAsync(@"Dat\GeneratedInserts.txt"));
                

            }

        }
    }
}