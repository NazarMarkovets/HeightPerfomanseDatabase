using System;
using System.IO;

namespace PG
{
    public class ReadFromFile
    {
        public void ReadData()
        {
            using (StreamReader r = File.OpenText(@"Dat\GeneratedInserts.txt"))
            {
                DumpLog(r);
            }
        }

        private static void DumpLog(TextReader r)
        {
            string line;
            while ((line = r.ReadLine()) != null)
            {
                Console.WriteLine(line);
            }
        }
        
    }
}