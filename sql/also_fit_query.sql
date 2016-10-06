/* Formatted on 10/5/2016 10:51:03 PM (QP5 v5.287) */
  SELECT DISTINCT
         msi.segment1 item_number,
         TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR') item_added_year,
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2014-1', 1,
                 0)
            "2014-Q1",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2014-2', 1,
                 0)
            "2014-Q2",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2014-3', 1,
                 0)
            "2014-Q3",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2014-4', 1,
                 0)
            "2014-Q4",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2015-1', 1,
                 0)
            "2015-Q1",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2015-2', 1,
                 0)
            "2015-Q2",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2015-3', 1,
                 0)
            "2015-Q3",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2015-4', 1,
                 0)
            "2015-Q4",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2016-1', 1,
                 0)
            "2016-Q1",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2016-2', 1,
                 0)
            "2016-Q2",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2016-3', 1,
                 0)
            "2016-Q3",
         DECODE (TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-Q'),
                 '2016-4', 1,
                 0)
            "2016-Q4",
         DECODE (mc.segment1 || mc.segment2, '1011', 1, 0) PL_1011,
         DECODE (mc.segment1 || mc.segment2, '1012', 1, 0) PL_1012,
         DECODE (mc.segment1 || mc.segment2, '1013', 1, 0) PL_1013,
         DECODE (NVL (msi.attribute1, 'D'), 'A', 1, 0) rank_a,
         DECODE (NVL (msi.attribute1, 'D'), 'B', 1, 0) rank_b,
         DECODE (NVL (msi.attribute1, 'D'), 'C', 1, 0) rank_c,
         DECODE (NVL (msi.attribute1, 'D'), 'N', 1, 0) rank_n,
         aces.year also_fit_year,
         aces.make also_fit_make,
         aces.model also_fit_model
    FROM mtl_system_items_b msi,
         mtl_item_categories mic,
         mtl_categories_b mc,
         xxgen_also_fit_aces aces
   WHERE     mic.inventory_item_id = msi.inventory_item_id
         AND mic.organization_id = msi.organization_id
         AND mc.category_id = mic.category_id
         AND mc.structure_id = 101
         AND aces.inventory_item_id = msi.inventory_item_id
         AND mc.segment1 != '40'
         AND mc.segment1 || mc.segment2 IN ('1011', '1012', '1013')
ORDER BY msi.segment1,
         aces.year,
         aces.make,
         aces.model