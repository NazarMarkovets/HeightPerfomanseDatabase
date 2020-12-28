using System.IO;

namespace PG
{
    class Getdata
    {
        readonly string database, lineForInsert;
        public Getdata(string dbname, string line)
        {
            this.database = dbname;
            this.lineForInsert = line;
        }

        internal string[] lines = File.ReadAllLines(@"Dat\data.txt");
        internal string line = "";
        internal int id = 1;
        internal int insertedRows = 0;


        internal void WriteInsert()
        {
            using (StreamWriter w = File.CreateText(@"Dat\log.txt"))
            {
                foreach (string lin in lines)
                {

                    insertedRows++;
                    string statement = $"INSERT INTO {database} VALUES ({insertedRows},{lineForInsert})";
                    WriteIntoFile(statement, w);

                }

            }
        }
        internal static void WriteIntoFile(string insert, TextWriter w)
        {
            w.WriteLine($"{insert}");
        }
    }


}




