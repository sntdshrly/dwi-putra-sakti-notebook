SELECT
    brand_tb.fv_brandname AS Nama_Brand,
    DATE_FORMAT(t_penjualanmst.fd_tgljual, '%b %Y') AS Bulan_Tahun,
    SUM(t_penjualandtl_goods.fn_jualpersize) AS Total_Qty_PCS_Per_Bulan
FROM
    t_penjualanmst
JOIN customer_tb ON t_penjualanmst.fn_cusid = customer_tb.fn_cusid
JOIN brand_tb ON brand_tb.fn_userinput = customer_tb.fn_userinput
JOIN t_penjualandtl_goods ON t_penjualanmst.fv_nopenjualan = t_penjualandtl_goods.fv_nopenjualan
WHERE
    t_penjualanmst.fd_tgljual BETWEEN '2023-01-01' AND '2023-10-31'
GROUP BY
    brand_tb.fv_brandname, DATE_FORMAT(t_penjualanmst.fd_tgljual, '%Y-%m')
ORDER BY
    brand_tb.fv_brandname, DATE_FORMAT(t_penjualanmst.fd_tgljual, '%Y-%m');