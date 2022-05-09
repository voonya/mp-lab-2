use "task.sml";

fun test(function_name : string, true_result, fact_result) =
    if true_result = fact_result
    then (function_name, "Passed")
    else (function_name, "Failed");

(* 1 *)
test("is_older", true, is_older((2021, 5, 30), (2021, 5, 31)));
test("is_older", false, is_older((2022, 5, 5), (2021, 10, 21)));
test("is_older", false, is_older((2003, 5, 5), (2003, 5, 5)));


(* 2 *)
test("number_in_month", 3, number_in_month([(2021, 5, 30), (2021, 5, 30), (2021, 5, 30), (2021, 6, 30), (2021, 1, 30), (2021, 2, 30)], 5));
test("number_in_month", 1, number_in_month([(2021, 5, 30), (2021, 5, 30), (2021, 5, 30), (2021, 6, 30), (2021, 1, 30), (2021, 2, 30)], 6));
test("number_in_month", 0, number_in_month([(2021, 5, 30), (2021, 5, 30), (2021, 5, 30), (2021, 6, 30), (2021, 1, 30), (2021, 2, 30)], 4));


(* 3 *)
test("number_in_months", 4, number_in_months([(2021, 5, 30), (2021, 5, 30), (2021, 5, 30), (2021, 6, 30), (2021, 1, 30), (2021, 2, 30)], [1, 5]));
test("number_in_months", 2, number_in_months([(2021, 5, 30), (2021, 5, 30), (2021, 5, 30), (2021, 6, 30), (2021, 1, 30), (2021, 2, 30)], [2, 6]));
test("number_in_months", 0, number_in_months([(2021, 5, 30), (2021, 5, 30), (2021, 5, 30), (2021, 6, 30), (2021, 1, 30), (2021, 2, 30)], []));


(* 4 *)
test("dates_in_month", [(2001, 1, 30), (2002, 1, 30), (2004, 1, 30)], dates_in_month([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], 1));
test("dates_in_month", [], dates_in_month([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], 5));
test("dates_in_month", [(2006, 3, 30)], dates_in_month([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], 3));


(* 5 *)
test("dates_in_months", [(2001, 1, 30), (2002, 1, 30), (2004, 1, 30), (2006, 3, 30)], dates_in_months([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], [1, 3, 8]));
test("dates_in_months", [], dates_in_months([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], [4, 5]));
test("dates_in_months", [], dates_in_months([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], []));


(* 6 *)
test("get_nth", "second", get_nth(["first", "second", "third", "fourth", "fifth"], 2));
test("get_nth", "fifth", get_nth(["first", "second", "third", "fourth", "fifth"], 5));
test("get_nth", "third", get_nth(["first", "second", "third", "fourth", "fifth"], 3));


(* 7 *)
test("date_to_string", "May 5, 2022", date_to_string((2022, 5, 5)));
test("date_to_string", "May 6, 2003", date_to_string((2003, 5, 6)));
test("date_to_string", "November 11, 2011", date_to_string((2011, 11, 11)));


(* 8 *)
test("number_before_reaching_sum", 3, number_before_reaching_sum(7, [1, 1, 1, 4, 5]));
test("number_before_reaching_sum", 3, number_before_reaching_sum(6, [1, 2, 2, 3, 5]));
test("number_before_reaching_sum", 0, number_before_reaching_sum(4, [10, 2, 3, 4, 5]));


(* 9 *)
test("what_month", 8, what_month(215));
test("what_month", 1, what_month(1));
test("what_month", 1, what_month(31));


(* 10 *)
test("month_range", [], month_range(30, 1));
test("month_range", [1, 2], month_range(31, 32));
test("month_range", [3, 3, 3], month_range(70, 72));


(* 11 *)
test("month_range", NONE, oldest_date([]));
test("month_range", SOME (2001, 1, 29), oldest_date([(2001, 1, 30), (2002, 1, 30), (2001, 2, 30), (2004, 1, 30), (2001, 1, 29), (2006, 3, 30)]));
test("month_range", SOME (2015, 1, 31), oldest_date([(2015, 2, 31), (2015, 2, 31), (2015, 1, 31)]));