prompt get_compression_type @cmrchk owner table sample(0.01)
prompt for a partition @cmrchk owner table "partition(P2014040) sample(0.01)" 
SELECT CASE comp_type
         WHEN 1 THEN 'No Compression'
         WHEN 2 THEN 'Advanced compression level'
         WHEN 4 THEN 'Hybrid Columnar Compression for Query High'
         WHEN 8 THEN 'Hybrid Columnar Compression for Query Low'
         WHEN 16 THEN 'Hybrid Columnar Compression for Archive High'
         WHEN 32 THEN 'Hybrid Columnar Compression for Archive Low'
         WHEN 64 THEN 'Compressed row'
         WHEN 128 THEN 'High compression level for LOB operations'
         WHEN 256 THEN 'Medium compression level for LOB operations'
         WHEN 512 THEN 'Low compression level for LOB operations'
         WHEN 1000 THEN 'Minimum required number of LOBs in the object for which LOB compression ratio is to be estimated'
         WHEN 4096 THEN 'Basic compression level'
         WHEN 5000 THEN 'Maximum number of LOBs used to compute the LOB compression ratio'
         WHEN 1000000 THEN 'Minimum required number of rows in the object for which HCC ratio is to be estimated'
         WHEN -1 THEN 'To indicate the use of all the rows in the object to estimate HCC ratio'
         ELSE 'Unknown Compression Type'
       END AS Compression_type,
       n as num_rows
FROM   (SELECT comp_type,
               Count(*) n
        FROM   (SELECT sys.dbms_compression.Get_compression_type('&1','&2', ROWID) AS comp_type FROM &1..&2  &3)
        GROUP  BY comp_type);
undef 1 2 3 4 5 6 7 8 9
