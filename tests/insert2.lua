pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")

function thread_init(thread_id)
   set_vars()
end

function event(thread_id)
   local table_name
   local i
   local c_val
   local k_val
   local pad_val

   table_name = "mgtest".. sb_rand_uniform(1, oltp_tables_count)

   if (oltp_auto_inc) then
      i = 0
      p = 0
   else
      i = sb_rand_uniq(1, oltp_table_size)
      p = sb_rand_uniq(1, oltp_table_size)
   end
   k_val = sb_rand(1, oltp_table_size)
   p_val = sb_rand(1, oltp_table_size)
   c_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
   o_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
   pad_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
   pado_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
   
   rs = db_query("INSERT INTO " .. table_name ..  " (id, k, c, pad) VALUES " .. string.format("(%d, %d, '%s', '%s')",i, k_val, c_val, pad_val))
   rs = db_query("INSERT INTO " .. table_name ..  " (id, k, c, pad) VALUES " .. string.format("(%d, %d, '%s', '%s')",p, p_val, o_val, pado_val))
end
