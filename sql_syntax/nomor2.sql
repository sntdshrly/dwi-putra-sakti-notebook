SELECT
    A.fv_articlename AS Nama_Artikel,
    P.fv_namacust AS Nama_Toko,
    -- EXTRACT(YEAR_MONTH FROM P.fd_tgljual) AS Bulan_Tahun,-- 
    DATE_FORMAT(P.fd_tgljual, '%M %Y') AS Bulan_Tahun,
    SUM(D.fn_hargabruto) AS Total_Penjualan_Per_Bulan
FROM
    t_penjualandtl_goods AS D
JOIN
    articlesize_tb AS S ON D.fv_artsizecode = S.fv_artsizecode
JOIN
    article_tb AS A ON S.fn_articleid = A.fn_articleid
JOIN
    t_penjualanmst AS P ON D.fv_nopenjualan = P.fv_nopenjualan
WHERE
    P.fd_tgljual BETWEEN '2023-01-01' AND '2023-10-31'
GROUP BY
    Nama_Artikel
ORDER BY
    Bulan_Tahun;
