/* Formatted on 10/7/2016 2:39:50 PM (QP5 v5.287) */
DECLARE
   p_predict_month       VARCHAR2 (10) := '2016-04';
   p_train_period        NUMBER := 1;

   p_product_line_from   VARCHAR2 (10) := '1011';
   p_product_line_to     VARCHAR2 (10) := '5015';
   p_ship_from_br_from   NUMBER := 81;
   p_ship_from_br_to     NUMBER := 85;
   --
   ln_loop_ctr           NUMBER;
   lv_line_text          VARCHAR2 (2000);
   lv_l24m_name          VARCHAR2 (10);
   lv_l23m_name          VARCHAR2 (10);
   lv_l22m_name          VARCHAR2 (10);
   lv_l21m_name          VARCHAR2 (10);
   lv_l20m_name          VARCHAR2 (10);
   lv_l19m_name          VARCHAR2 (10);
   lv_l18m_name          VARCHAR2 (10);
   lv_l17m_name          VARCHAR2 (10);
   lv_l16m_name          VARCHAR2 (10);
   lv_l15m_name          VARCHAR2 (10);
   lv_l14m_name          VARCHAR2 (10);
   lv_l13m_name          VARCHAR2 (10);
   lv_l12m_name          VARCHAR2 (10);
   lv_l11m_name          VARCHAR2 (10);
   lv_l10m_name          VARCHAR2 (10);
   lv_l9m_name           VARCHAR2 (10);
   lv_l8m_name           VARCHAR2 (10);
   lv_l7m_name           VARCHAR2 (10);
   lv_l6m_name           VARCHAR2 (10);
   lv_l5m_name           VARCHAR2 (10);
   lv_l4m_name           VARCHAR2 (10);
   lv_l3m_name           VARCHAR2 (10);
   lv_l2m_name           VARCHAR2 (10);
   lv_l1m_name           VARCHAR2 (10);
   lv_cm_name            VARCHAR2 (10);
   lv_nm_name            VARCHAR2 (10);
   lv_item_added_date    VARCHAR2 (10);

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

   -- last twenty sales history + one monther buffer + one validation month
   CURSOR cur_26m_period (
      target_month    VARCHAR2)
   IS
        SELECT -1 * ROWNUM + 2 seq, sub.ending_date
          FROM (  SELECT TO_CHAR (gp.start_date, 'RRRR-MM') ending_date
                    FROM gl_periods gp
                   WHERE     gp.period_type = 'Month'
                         AND gp.period_set_name = 'XXSOL Month'
                         AND gp.start_date >=
                                ADD_MONTHS (
                                   TRUNC (TO_DATE (target_month, 'RRRR-MM'),
                                          'MONTH'),
                                   -25)
                         AND gp.start_date <=
                                TRUNC (TO_DATE (target_month, 'RRRR-MM'),
                                       'MONTH')
                ORDER BY gp.start_date DESC) sub
      ORDER BY seq;

   CURSOR cur_sales_history (
      target_month    VARCHAR2)
   IS
        SELECT msi.segment1 item_number,
               oh.ship_from_org_id br_id,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l24m_name, xmscv.order_qty,
                          0))
                  l24m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l23m_name, xmscv.order_qty,
                          0))
                  l23m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l22m_name, xmscv.order_qty,
                          0))
                  l22m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l21m_name, xmscv.order_qty,
                          0))
                  l21m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l20m_name, xmscv.order_qty,
                          0))
                  l20m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l19m_name, xmscv.order_qty,
                          0))
                  l19m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l18m_name, xmscv.order_qty,
                          0))
                  l18m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l17m_name, xmscv.order_qty,
                          0))
                  l17m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l16m_name, xmscv.order_qty,
                          0))
                  l16m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l15m_name, xmscv.order_qty,
                          0))
                  l15m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l14m_name, xmscv.order_qty,
                          0))
                  l14m_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_l13m_name, xmscv.order_qty,
                          0))
                  l13m_so,
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
                  cm_so,
               SUM (
                  DECODE (TO_CHAR (oh.ordered_date, 'RRRR-MM'),
                          lv_nm_name, xmscv.order_qty,
                          0))
                  nm_so
          FROM oe_order_headers_all oh,
               XXGEN.XXGEN_MULTIPLE_SO_COMBINE_TEMP xmscv,
               mtl_system_items_b msi,
               mtl_item_categories mic,
               mtl_categories mc
         WHERE     xmscv.top_order = oh.order_number
               AND msi.inventory_item_id = xmscv.inventory_item_id
               AND msi.organization_id = oh.ship_from_org_id
               AND mic.inventory_item_id = msi.inventory_item_id
               AND mic.organization_id = msi.organization_id
               AND mc.category_id = mic.category_id
               --
               AND oh.ordered_date >=
                      ADD_MONTHS (TO_DATE (target_month, 'RRRR-MM'), -25)
               AND oh.ordered_date <
                      ADD_MONTHS (TO_DATE (target_month, 'RRRR-MM'), 1)
               AND oh.cancelled_flag = 'N'
               AND NVL (oh.attribute8, 'N') = 'N'           -- container order
               --
               AND mc.structure_id = 101
               AND mc.disable_date IS NULL
               AND mc.segment1 || mc.segment2 BETWEEN p_product_line_from
                                                  AND p_product_line_to
               AND mc.segment1 != '40'
               AND oh.ship_from_org_id BETWEEN p_ship_from_br_from
                                           AND p_ship_from_br_to
               AND TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRR-MM') <=
                      lv_item_added_date
      GROUP BY msi.segment1, oh.ship_from_org_id
      ORDER BY msi.segment1, oh.ship_from_org_id;

   PROCEDURE dopl (line VARCHAR2)
   IS
   BEGIN
      DBMS_OUTPUT.put_line (line);
   END;
-- By item, branch


BEGIN
   -- Assign the start_date and end_date
   lv_line_text :=
         'ITEM_NUMBER,BR_ID,'
      || 'L24M,L23M,L22M,L21M,L20M,L19M,L18M,L17M,L16M,L15M,L14M,L13M,'
      || 'L12M,L11M,L10M,L9M,L8M,L7M,L6M,L5M,L4M,L3M,L2M,L1M,CM,NM';
   dopl (lv_line_text);


   FOR rec_lag_period IN cur_lag_period (p_predict_month, p_train_period)
   LOOP
      lv_line_text := 'ITEM_NUMBER,BR_ID';

      FOR rec_period IN cur_26m_period (rec_lag_period.ending_date)
      LOOP
         IF (rec_period.seq = -24)
         THEN
            lv_l24m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -23)
         THEN
            lv_l23m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -22)
         THEN
            lv_l22m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -21)
         THEN
            lv_l21m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -20)
         THEN
            lv_l20m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -19)
         THEN
            lv_l19m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -18)
         THEN
            lv_l18m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -17)
         THEN
            lv_l17m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -16)
         THEN
            lv_l16m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -15)
         THEN
            lv_l15m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -14)
         THEN
            lv_l14m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -13)
         THEN
            lv_l13m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -12)
         THEN
            lv_l12m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -11)
         THEN
            lv_l11m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -10)
         THEN
            lv_l10m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -9)
         THEN
            lv_l9m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -8)
         THEN
            lv_l8m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -7)
         THEN
            lv_l7m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -6)
         THEN
            lv_l6m_name := rec_period.ending_date;
            lv_item_added_date := rec_period.ending_date;
         ELSIF (rec_period.seq = -5)
         THEN
            lv_l5m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -4)
         THEN
            lv_l4m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -3)
         THEN
            lv_l3m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -2)
         THEN
            lv_l2m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = -1)
         THEN
            lv_l1m_name := rec_period.ending_date;
         ELSIF (rec_period.seq = 0)
         THEN
            lv_cm_name := rec_period.ending_date;
         ELSIF (rec_period.seq = 1)
         THEN
            lv_nm_name := rec_period.ending_date;
         END IF;

         lv_line_text := lv_line_text || ',' || rec_period.ending_date;
      END LOOP;

      IF FALSE
      THEN
         dopl (lv_line_text);
      ELSE
         NULL;
      END IF;

      FOR rec_sales_history IN cur_sales_history (rec_lag_period.ending_date)
      LOOP
         -- Show Line
         lv_line_text :=
               '"'
            || rec_sales_history.item_number
            || '",'
            || rec_sales_history.br_id
            || ','
            || rec_sales_history.l24m_so
            || ','
            || rec_sales_history.l23m_so
            || ','
            || rec_sales_history.l22m_so
            || ','
            || rec_sales_history.l21m_so
            || ','
            || rec_sales_history.l20m_so
            || ','
            || rec_sales_history.l19m_so
            || ','
            || rec_sales_history.l18m_so
            || ','
            || rec_sales_history.l17m_so
            || ','
            || rec_sales_history.l16m_so
            || ','
            || rec_sales_history.l15m_so
            || ','
            || rec_sales_history.l14m_so
            || ','
            || rec_sales_history.l13m_so
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
            || rec_sales_history.cm_so
            || ','
            || rec_sales_history.nm_so;


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