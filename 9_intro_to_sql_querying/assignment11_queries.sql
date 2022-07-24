select * from symbols;

select *
from symbols
where official_symbol_a = 'ARP4' or official_symbol_b = 'ARP4'
;

select
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%ARP4%'
        then 1
        else 0
        end
    ) as ARP4,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%ARP8%'
        then 1
        else 0
        end
    ) as ARP8,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%NHP10%'
        then 1
        else 0
        end
    ) as NHP10,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%ARP5%'
        then 1
        else 0
        end
    ) as ARP5,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%RVB1%'
        then 1
        else 0
        end
    ) as RVB1,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%RVB2%'
        then 1
        else 0
        end
    ) as RVB2,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%TAF14%'
        then 1
        else 0
        end
    ) as TAF14,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%IES2%'
        then 1
        else 0
        end
    ) as IES2,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%IES6%'
        then 1
        else 0
        end
    ) as IES6,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%IES1%'
        then 1
        else 0
        end
    ) as IES1,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%IES3%'
        then 1
        else 0
        end
    ) as IES3,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%IES5%'
        then 1
        else 0
        end
    ) as IES5,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%ACT1%'
        then 1
        else 0
        end
    ) as ACT1,
    sum(
        case when
            concat(official_symbol_a, '-', official_symbol_b) like '%INO80%'
        then 1
        else 0
        end
    ) as INO80,
    count(*) as total
from symbols
where official_symbol_a in (
	'ARP4'
	,'ARP8'
	,'NHP10'
	,'ARP5'
	,'RVB1'
	,'RVB2'
	,'TAF14'
	,'IES2'
	,'IES6'
	,'IES1'
	,'IES3'
	,'IES5'
	,'ACT1'
	,'INO80'   
) or official_symbol_b in (
	'ARP4'
	,'ARP8'
	,'NHP10'
	,'ARP5'
	,'RVB1'
	,'RVB2'
	,'TAF14'
	,'IES2'
	,'IES6'
	,'IES1'
	,'IES3'
	,'IES5'
	,'ACT1'
	,'INO80'   
)
;