SELECT
    t_penjualandtl_goods.fv_articlename AS Nama_Artikel,
    fv_namacust AS Nama_Toko,
    EXTRACT(YEAR_MONTH FROM t_penjualanmst.fd_tgljual) AS Bulan_Tahun,
    SUM(t_penjualandtl_goods.fn_jualpersize) AS Total_Qty_PCS
FROM
    t_penjualanmst
JOIN
    t_penjualandtl_goods ON t_penjualanmst.fv_nopenjualan = t_penjualandtl_goods.fv_nopenjualan
WHERE
    t_penjualanmst.fd_tgljual BETWEEN '2023-01-01' AND '2023-10-31'
GROUP BY
    Nama_Artikel
ORDER BY
    Bulan_Tahun;