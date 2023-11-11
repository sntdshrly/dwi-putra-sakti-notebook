SELECT
    F.fv_fitname AS Nama_Fitting,
    MONTH(P.fd_tgljual) AS Bulan,
    SUM(G.fn_hargabruto) AS Total_Rp_Penjualan
FROM
    t_penjualanmst P
JOIN
    t_penjualandtl_goods G ON P.fv_nopenjualan = G.fv_nopenjualan
JOIN
    article_tb A ON G.fv_articlecode = A.fv_articlecode
JOIN
    fitting_tb F ON A.fn_fitid = F.fn_fitid
WHERE
    P.fd_tgljual BETWEEN '2023-01-01' AND '2023-10-31'
GROUP BY
    Nama_Fitting, Bulan
ORDER BY
    Nama_Fitting, Bulan;
