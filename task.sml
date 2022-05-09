(*----------------1---------------*)
fun is_older (date1: int* int* int, date2: int* int* int) =
    if (#1 date1) < (#1 date2) then 
        true
    else if (#1 date1) = (#1 date2) then
        if (#2 date1) < (#2 date2) then
            true
        else if ((#2 date1) = (#2 date2)) andalso ((#3 date1) < (#3 date2)) then
            true
        else
            false
    else
        false

(*----------------2---------------*)

fun number_in_month (datelist: (int* int* int) list, month: int) =
    if null datelist then
        0
    else
        if #2 (hd datelist) = month then
            1 + number_in_month(tl datelist, month)
        else
            number_in_month(tl datelist, month)

(*----------------3---------------*)

fun number_in_months (datelist: (int* int* int) list, monthlist: int list ) =
    if null monthlist then
        0
    else 
        number_in_month(datelist, hd monthlist) + number_in_months(datelist, tl monthlist)


(*----------------4---------------*)

fun dates_in_month (datelist: (int* int* int) list, month: int) =
    if null datelist then
        []
    else
        if #2 (hd datelist) = month then
            (hd datelist) :: dates_in_month(tl datelist, month)
        else
            dates_in_month(tl datelist, month)


(*----------------5---------------*)


fun dates_in_months (datelist: (int* int* int) list, monthlist: int list) = 
    if null monthlist then
        []
    else 
        dates_in_month(datelist, hd monthlist) @ dates_in_months(datelist, tl monthlist)


(*----------------6---------------*)

fun get_nth (stringlist : string list, n : int) = 
    if null stringlist then
        ""
    else 
        if n = 1 then
            hd stringlist
        else
            gen_nth(tl stringlist, n - 1)


(*----------------7---------------*)

fun date_to_string (date: int* int* int) =
    gen_nth(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    , #2 date) ^ " " ^ (Int.toString (#3 date)) ^ ", " ^ (Int.toString (#1 date))


(*----------------8---------------*)

fun number_before_reaching_sum (sum: int, intlist: int list) =
    if null intlist then
        0
    else
        if (sum - (hd intlist)) <= 0 then
            0
        else
            1 + number_before_reaching_sum(sum - (hd intlist), tl intlist)


(*----------------9---------------*)
fun what_month (day: int) =
    number_before_reaching_sum(day, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) + 1


(*----------------10---------------*)
fun month_range (day1: int, day2: int) = 
    if day1 > day2 then
        []
    else 
        what_month(day1) :: month_range(day1 + 1, day2)


(*----------------11---------------*)
fun oldest_date (datelist: (int* int* int) list) =
    if null datelist then 
        NONE
    else 
        let fun oldest_date_nonempty (datelist : (int*int*int) list) =
                if null (tl datelist) then
                    hd datelist
                else 
                    let val tl_ans = oldest_date_nonempty(tl datelist)
                    in
                        if is_older(hd datelist, tl_ans) then
                            hd datelist
                        else 
                            tl_ans
                    end
        in
            SOME (oldest_date_nonempty(datelist))
        end;




