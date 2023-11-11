SELECT
    D.fv_divname AS Nama_Divisi,
    MONTH(P.fd_tgljual) AS Bulan,
    SUM(G.fn_jualpersize) AS Total_Qty_PCS_Per_Bulan
FROM
    t_penjualanmst P
JOIN
    division_tb D ON P.fn_divid = D.fn_divid
JOIN
    t_penjualandtl_goods G ON P.fv_nopenjualan = G.fv_nopenjualan
WHERE
    P.fd_tgljual BETWEEN '2023-01-01' AND '2023-10-31'
GROUP BY
    D.fv_divname, Bulan
ORDER BY
    D.fv_divname, Bulan
