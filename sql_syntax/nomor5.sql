SELECT
    C.fv_colorname AS Nama_Color,
    MONTH(P.fd_tgljual) AS Bulan,
    SUM(D.fn_jualpersize) AS Total_Qty_PCS
FROM
    t_penjualanmst P
JOIN
    t_penjualandtl_goods D ON P.fv_nopenjualan = D.fv_nopenjualan
JOIN
    article_tb A ON A.fv_articlecode = D.fv_articlecode
JOIN
    color_tb C ON A.fn_colorid = C.fn_colorid
WHERE
    P.fd_tgljual BETWEEN '2023-01-01' AND '2023-10-31'
GROUP BY
    C.fv_colorname, Bulan
ORDER BY
    C.fv_colorname, Bulan;
