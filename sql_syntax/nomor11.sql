SELECT
    mt.fv_namemark AS 'Nama Mark',
    MONTH(mst.fd_tgljual) AS 'Bulan',
    SUM(dt.fn_jualpersize) AS 'Total Qty PCS'
FROM
    t_penjualanmst mst
JOIN
    t_penjualandtl_goods dt ON mst.fv_nopenjualan = dt.fv_nopenjualan
JOIN
    markdown_tb mt ON dt.fn_markid = mt.fn_markid
GROUP BY
    mt.fv_namemark, MONTH(mst.fd_tgljual)
ORDER BY
    mt.fv_namemark, MONTH(mst.fd_tgljual);
