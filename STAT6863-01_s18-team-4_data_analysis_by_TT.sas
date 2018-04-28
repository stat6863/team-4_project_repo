
*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that will generate final analytic file; 
%include '.\STAT6863-01_s18-team-4_data_preparation.sas';


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
Question: What is the distribution of Bitcoin BTC from April 2016 to present?

Rationale: This should help identify the specific distribution of BTC'

Note: This compares the column the column "Close" from btcusd16 to the same
name column from btcusd17 and btcusd18.

Limitations: This methodology does not account for any datasets with missing 
data nor does it attempt to validate data in any way.
;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
Question: What are the top 10 highest prices and top 10 lowest prices during 
these years?

Rationale: This would provide more BTC behaviors, movements and have a better 
insights why there are such changes.

Note: This compares the column the column "High" and "Low" from btcusd16 to the 
same name columns from btcusd17 and btcusd18.

Limitations: This methodology does not account for any datasets with missing 
data nor does it attempt to validate data in any way.
;

proc sql;
    create table high_top10 as
        select
            Date
            ,High format=dollar12.2
        from
            btcusd161718_v2
        order by
            High descending
        ;
    create table high_top10_print as
        select
            *
        from
            high_top10(obs=10)
        ;
quit;


proc print
    data=high_top10_print
    noobs style(header)={just=c}
    ;
    id
        Date
    ;
    var
        High
    ;
    title "Top 10 High's"
    ;
run;



proc sql;
    create table high_bottom10 as
        select
            Date
            ,High format=dollar12.2
        from
            btcusd161718_v2
        order by
            High
        ;
    create table high_top10_print as
        select
            *
        from
            high_bottom10(obs=10)
        ;
quit;


proc print
    data=high_bottom10_prin
    noobs style(header)={just=c}
    ;
    id
        Date
    ;
    var
        High
    ;
    title "Bottom 10 High's"
    ;
run;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
Question: What are major corrections in Bitcoin history?

Rationale: This would provide more true understanding of a few major corrections 
in the past and use those outputs to forecast or predict the BTC price for the 
year of 2018.

Note: This compares the column the column "Date_ID" and "Low" from btcusd16 to 
the same name columns from btcusd17 and btcusd18 to find a reverse movement 
which is usually negative, and any resistance and support levels.

Limitations: Even though predictive modeling is specified in the research
questions, this methodology solely relies on a crude descriptive technique
by looking at a trend line and linear regression.
;

