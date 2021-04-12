# 2021-04-12 Non-obvious vectors

* Content-Type attacks
  * vector that executes on parse
  * multiple vulns appear in JPEG parsing libraries
    * 2004 GDI+ allowed ACE on JPEG parse
    * 2010 MSPaint allowed ACE via JPEG parse
  * compression bombs
    * monochromatic images that expand to GBs
  * new format are incredibly complex
    * PDF v6 is 1310 pages
    * MSOXML is 929 pages to describe how Microsoft **interpreted** OpenXML
  * document may have binary loader inserted that jumps to malware program
  * PDF files are the most targeted file format
* PDF file formt
  * start with a line with PDF version
    * `%PDF-1.1`
  * rest of document is a hierachy of objects
    * `[index #] [version #] obj ... << [content] >>`
    * objects link together to create a document
    * tree structure
  * data is uncompressed by default
    * but often compressed to obfuscate content
    * checking PDF for malicious code is hard
  * objects can contain arbitrary javacript
    * js is run when object is parsed (document open)
  * PDF spec has a lot of flexibility for obfuscation
    * hard to scan for!
  * exploits can be triggered through a lot of means
    * annotations
    * forms
    * objects may be compressed and triggered after decmp
  * defenses
    * disable JS (breaks number of PDF forms)
    * parsing engines are complicated 
    * CVE-2008-2992 overflow vuln in printf impl in PDF engine
      * could be exploited for ACE on parse
    * turning off library features breaks standards
    * virus scanners are reactive and need signatures
  * adobe reader has DEP (NX) but this isnt sufficient
* Future trends
  * Dorifel virus
    * uses RTL unicode vuln to hide itself
    * RTL unicode override (RLO) allows for phishing
      * `www.payp[RLO]moc.la` displays as `www.paypal.com`.
    * `Resume - John Al[ROG]cod.exe` displays as `Resume - John Alexe.doc`
    * scans word and excel docs to replace with Dorifel execuable
  * Plist parser would allow for jailbreaking app sandbox due to multiple XML parsers in iOS
  * 