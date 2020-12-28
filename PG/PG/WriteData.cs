using System.IO;

namespace PG
{
    class WriteData
    {
        
        internal string database;
        internal int counter;
        internal string oneline { get; set; }
        public WriteData()
        {
            
        }
        public WriteData(string dbname, int counter)
        {
            database = dbname;
            this.counter = counter;
        }
        
        internal int insertedRows = 0;


        internal void WriteInsert( string lines)
        {
            using (StreamWriter w = new StreamWriter(@"Dat\GeneratedInserts.txt",true))
            {
                
                    char c = '"';
                    insertedRows++;
                    var statement = $"INSERT INTO {database} VALUES ({insertedRows},{c}{lines}{c})";
                    WriteIntoFile(statement, w);
            }
        }
        internal void WriteIntoFile(string insert, TextWriter w)
        {
            w.WriteLine($"{insert}");
            w.Close();
        }

        internal void WriteFormatedText(string lines)
        {
            using (StreamWriter сWriter = File.AppendText(@"Dat\FormatedText.txt"))
            {
                WriteIntoFile(lines, сWriter);
            }
        }
    }


}




