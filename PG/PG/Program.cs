using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace PG
{
    class Program

    {

        

        static async System.Threading.Tasks.Task Main(string[] args)
        {
            
            #region varForOperations
            Console.WriteLine($"Enter name of database:");
            string dbname = Console.ReadLine();
            Console.WriteLine($"Enter name of table:");
            dbname += "." + Console.ReadLine();
            Console.WriteLine("Enter count of rows you need");
            int counter = int.Parse(Console.ReadLine());
            //Console.WriteLine($"Enter name of ID column:");
            //string idColumn = Console.ReadLine();
            #endregion
            

            #region DecodingData
            //var linedata = File.ReadAllLines(@"Dat\data.txt");
            //Random rnd = new Random();
            //char dot = '.';

            string filecontent = " ";

            using (StreamReader sr = new StreamReader(@"Dat\data.txt"))
            {
                filecontent = sr.ReadToEnd();
                LinkedList<string> lines = new LinkedList<string>(filecontent.Split('\n'));
                LinkedList<string> longLines = new LinkedList<string>();
                //LinkedList<string> truncatedLines = new LinkedList<string>();
                foreach (var line in lines)
                {
                    if(line.Length > 20)
                    {
                        longLines.AddLast(line.Trim());
                        
                    }
                }
                using (StreamWriter w = File.AppendText(@"Dat\test.txt"))
                {
                    foreach (var l in longLines)
                    {
                        //string statement = $"INSERT INTO {dbname} VALUES ({insertedRows},{line})";
                        WriteIntoFile(l, w);
                    }
                }
            }






            #endregion





            /*

            #region GetDataFromFile
            var lines = File.ReadAllLines(@"Dat\data.txt");
            string line = "";
            int id = 1;
            int insertedRows = 0;
            using (StreamWriter w = File.AppendText(@"Dat\log.txt"))
            {
                foreach (var name in lines)
                {
                    if (insertedRows == counter) break;
                    line += " " + name;
                    
                    if (id % 2 == 0)
                    {
                        insertedRows++;
                        string statement = $"INSERT INTO {dbname} VALUES ({insertedRows},{line})";
                        WriteIntoFile(statement, w);

                        line = " ";
                    }
                    id += 1;
                }
            }

            #endregion

            /*
            #region Streamwriter
            //  using (StreamWriter w = File.AppendText("log.txt"))
            //  {

            //         for (var i = 1; i <= counter; i++)
            //         {
            //             string txt = GenRandomString("АБВГДЕЁЖЗИЙЛКМНОПРСТУФХЧШЩЬЯЮабвгдеёжзийлкмнопрстуфхчшщьяю", 200);
            //             WriteIntoFile($"UPDATE {dbname} = '{txt}' WHERE (`{idColumn}` = {i});", w);
            //         }
            



              }
            #endregion

            

            #region Reader definition

            using (StreamReader r = File.OpenText(@"Dat\log.txt"))
            {
                DumpLog(r);
            }

            #endregion
            */



            // string GenRandomString(string Alphabet, int Length)
            // {

            // Random rnd = new Random();            
            // StringBuilder sb = new StringBuilder(Length-1);
            // int Position = 0;

            // for (int i = 0; i < Length; i++)
            // {
            //     Position = rnd.Next(0, Alphabet.Length-1);
            //     if (i%6 == 0)
            //     {
            //         sb.Append(" ");
            //     }
            //     else
            //     {
            //         sb.Append(Alphabet[Position]);
            //     }


            // }

            // return sb.ToString();
            // }
        }

        static int Generate(Random rmd)
        {
            return rmd.Next(100);
        }
        #region Write_into_file

        public static void WriteIntoFile(string logMessage, TextWriter w)
        {
            w.WriteLine($"{logMessage}");
        }

        #endregion

        #region Read_from_file
        public static void DumpLog(StreamReader r)
        {
            string line;
            while ((line = r.ReadLine()) != null)
            {
                Console.WriteLine(line);
            }
        }
        #endregion

    }

}
