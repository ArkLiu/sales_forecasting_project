/* Formatted on 10/4/2016 3:49:28 PM (QP5 v5.287) */
DECLARE
   p_predict_month      VARCHAR2 (100) := '2016-01';
   p_train_period       NUMBER := 6;

   p_pl_fm              VARCHAR2 (100) := '1011';
   p_pl_to              VARCHAR2 (100) := '1013';
   p_br_fm              NUMBER := 81;
   p_br_to              NUMBER := 81;
   --
   ln_loop_ctr          NUMBER;
   lv_line_text         VARCHAR2 (2000);
   lv_l12m_name         VARCHAR2 (100);
   lv_l11m_name         VARCHAR2 (100);
   lv_l10m_name         VARCHAR2 (100);
   lv_l9m_name          VARCHAR2 (100);
   lv_l8m_name          VARCHAR2 (100);
   lv_l7m_name          VARCHAR2 (100);
   lv_l6m_name          VARCHAR2 (100);
   lv_l5m_name          VARCHAR2 (100);
   lv_l4m_name          VARCHAR2 (100);
   lv_l3m_name          VARCHAR2 (100);
   lv_l2m_name          VARCHAR2 (100);
   lv_l1m_name          VARCHAR2 (100);
   lv_cm_name           VARCHAR2 (100);
   lv_item_added_date   VARCHAR2 (100);

   -- L12M  time period
   CURSOR cur_lag_period (
      target_month    VARCHAR2,
      month_period    NUMBER)
   IS
        SELECT TO_CHAR (gp.start_date, 'RRRR-MM') ending_date
          FROM gl_periods gp
         WHERE     gp.period_type = 'Month'
               AND gp.period_set_name = 'XXSOL Month'
               AND gp.start_date >=
                      ADD_MONTHS (
                         TRUNC (TO_DATE (target_month, 'RRRR-MM'), 'MONTH'),
                         -1 * (month_period - 1))
               AND gp.start_date <=
                      TRUNC (TO_DATE (target_month, 'RRRR-MM'), 'MONTH')
      ORDER BY gp.start_date;


   CURSOR cur_12m_period (
      target_month    VARCHAR2)
   IS
        SELECT TO_CHAR (gp.start_date, 'RRRR-MM') ending_date,
               gp.start_date,
               gp.end_date
          FROM gl_periods gp
         WHERE     gp.period_type = 'Month'
               AND gp.period_set_name = 'XXSOL Month'
               AND gp.start_date >=
                      ADD_MONTHS (
                         TRUNC (TO_DATE (target_month, 'RRRR-MM'), 'MONTH'),
                         -12)
               AND gp.start_date <=
                      TRUNC (TO_DATE (target_month, 'RRRR-MM'), 'MONTH')
      ORDER BY gp.start_date;

   CURSOR cur_sales_history (
      target_month    VARCHAR2)
   IS
        SELECT msi.segment1 item_number,
               mp.organization_id br_id,
               msi.attribute3 item_added_date,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l12m_name, xmscv.order_qty,
                          0))
                  l12m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l11m_name, xmscv.order_qty,
                          0))
                  l11m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l10m_name, xmscv.order_qty,
                          0))
                  l10m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l9m_name, xmscv.order_qty,
                          0))
                  l9m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l8m_name, xmscv.order_qty,
                          0))
                  l8m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l7m_name, xmscv.order_qty,
                          0))
                  l7m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l6m_name, xmscv.order_qty,
                          0))
                  l6m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l5m_name, xmscv.order_qty,
                          0))
                  l5m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l4m_name, xmscv.order_qty,
                          0))
                  l4m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l3m_name, xmscv.order_qty,
                          0))
                  l3m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l2m_name, xmscv.order_qty,
                          0))
                  l2m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l1m_name, xmscv.order_qty,
                          0))
                  l1m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_cm_name, xmscv.order_qty,
                          0))
                  cm_so
          FROM oe_order_headers_all oh,
               xxgen_multiple_so_combine_v xmscv,
               mtl_system_items_b msi,
               mtl_item_categories mic,
               mtl_categories mc,
               mtl_parameters mp
         WHERE     xmscv.top_order = oh.order_number
               AND msi.inventory_item_id = xmscv.inventory_item_id
               AND msi.organization_id = oh.ship_from_org_id
               AND mic.inventory_item_id = msi.inventory_item_id
               AND mic.organization_id = msi.organization_id
               AND mc.category_id = mic.category_id
               AND mp.organization_id = oh.ship_from_org_id
               --
               AND oh.ordered_date >=
                      ADD_MONTHS (TO_DATE (target_month, 'RRRR-MM'), -12)
               AND oh.ordered_date <
                      ADD_MONTHS (TO_DATE (target_month, 'RRRR-MM'), 1)
               AND oh.cancelled_flag = 'N'
               --
               AND mc.structure_id = 101
               AND mc.disable_date IS NULL
               AND mc.segment1 || mc.segment2 BETWEEN p_pl_fm AND p_pl_to
               AND mp.organization_id BETWEEN p_br_fm AND p_br_to
               AND TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-MM') <=
                      lv_item_added_date
      GROUP BY msi.segment1, mp.organization_id, msi.attribute3;

   PROCEDURE dopl (line VARCHAR2)
   IS
   BEGIN
      DBMS_OUTPUT.put_line (line);
   END;
-- By item, branch


BEGIN
   -- Assign the start_date and end_date

   dopl (
      'ITEM_NUMBER,ITEM_ADDED_DATE,BR_ID,L12M,L11M,L10M,L9M,L8M,L7M,L6M,L5M,L4M,L3M,L2M,L1M,CM');


   FOR rec_lag_period IN cur_lag_period (p_predict_month, 6)
   LOOP
      ln_loop_ctr := 0;
      lv_line_text := 'ITEM NUMBER,ITEM_ADDED_DATE,BR_ID';

      FOR rec_period IN cur_12m_period (rec_lag_period.ending_date)
      LOOP
         ln_loop_ctr := ln_loop_ctr + 1;
         lv_line_text := lv_line_text || ',' || rec_period.ending_date;

         IF (ln_loop_ctr = 1)
         THEN
            lv_item_added_date := rec_period.ending_date;
            lv_l12m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 2)
         THEN
            lv_l11m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 3)
         THEN
            lv_l10m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 4)
         THEN
            lv_l9m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 5)
         THEN
            lv_l8m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 6)
         THEN
            lv_l7m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 7)
         THEN
            lv_l6m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 8)
         THEN
            lv_l5m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 9)
         THEN
            lv_l4m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 10)
         THEN
            lv_l3m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 11)
         THEN
            lv_l2m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 12)
         THEN
            lv_l1m_name := rec_period.ending_date;
         ELSIF (ln_loop_ctr = 13)
         THEN
            lv_cm_name := rec_period.ending_date;
         END IF;
      END LOOP;

      -- Show Header
      dopl (lv_line_text);

      FOR rec_sales_history IN cur_sales_history (rec_lag_period.ending_date)
      LOOP
         -- Show Line
         lv_line_text :=
               '"'
            || rec_sales_history.item_number
            || '","'
            || rec_sales_history.item_added_date
            || '",'
            || rec_sales_history.br_id
            || ','
            || rec_sales_history.l12m_so
            || ','
            || rec_sales_history.l11m_so
            || ','
            || rec_sales_history.l10m_so
            || ','
            || rec_sales_history.l9m_so
            || ','
            || rec_sales_history.l8m_so
            || ','
            || rec_sales_history.l7m_so
            || ','
            || rec_sales_history.l6m_so
            || ','
            || rec_sales_history.l5m_so
            || ','
            || rec_sales_history.l4m_so
            || ','
            || rec_sales_history.l3m_so
            || ','
            || rec_sales_history.l2m_so
            || ','
            || rec_sales_history.l1m_so
            || ','
            || rec_sales_history.cm_so;


         dopl (lv_line_text);
      END LOOP;
   END LOOP;
-- Handle Exception
EXCEPTION
   WHEN OTHERS
   THEN
      -- Error
      dopl ('Errors: ' || '-' || SQLCODE || ' - ' || SQLERRM);
END;