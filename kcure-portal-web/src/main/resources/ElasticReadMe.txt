* Logstash config
위치: /etc/logstash/conf.d/cncr.conf
내용:
input {
    jdbc {
        jdbc_driver_library => "/usr/share/logstash/bin/postgresql-42.5.4.jar"
        jdbc_driver_class => "org.postgresql.Driver"
        jdbc_connection_string => "jdbc:postgresql://198.18.228.118:5432/kcure"
        jdbc_user => "kcure"
        jdbc_password => "kcure"
        schedule => "* * * * *"
        statement => "select csc.ctlg_spcd, csc.hosp_seq, csc.hosp_nm, csc.ctlg_nm, csc.ctlg_smry_cont, csc.ctlg_coll_dtrn_vl, csc.ctlg_tbl_col_vl, csc.ctlg_rnwl_cycl_vl, csc.ctlg_kyw_cont, csc.ctlg_cont, csc.ctlg_aplc_prcs_cont, csc.crtn_dt, csci.arry_ord_vl, csci.hosp_nm, csci.ctlg_nm, csci.ctlg_item_spnm, csci.ctlg_item_nm, csci.ctlg_item_cont, csci.crtn_dt from portal.cncr_spzn_ctlg csc inner join portal.cncr_spzn_ctlg_item csci on csci.hosp_seq = csc.hosp_seq and csci.ctlg_spcd = csc.ctlg_spcd where csc.ctlg_spcd='1'"
        tags => "cncr_spzn_ctlg_spcd_1"
    }
}
input {
    jdbc {
        jdbc_driver_library => "/usr/share/logstash/bin/postgresql-42.5.4.jar"
        jdbc_driver_class => "org.postgresql.Driver"
        jdbc_connection_string => "jdbc:postgresql://198.18.228.118:5432/kcure"
        jdbc_user => "kcure"
        jdbc_password => "kcure"
        schedule => "* * * * *"
        statement => "select csc.ctlg_spcd, csc.hosp_seq, csc.hosp_nm, csc.ctlg_nm, csc.ctlg_smry_cont, csc.ctlg_coll_dtrn_vl, csc.ctlg_tbl_col_vl, csc.ctlg_rnwl_cycl_vl, csc.ctlg_kyw_cont, csc.ctlg_cont, csc.ctlg_aplc_prcs_cont, csc.crtn_dt, csci.arry_ord_vl, csci.hosp_nm, csci.ctlg_nm, csci.ctlg_item_spnm, csci.ctlg_item_nm, csci.ctlg_item_cont, csci.crtn_dt from portal.cncr_spzn_ctlg csc inner join portal.cncr_spzn_ctlg_item csci on csci.hosp_seq = csc.hosp_seq and csci.ctlg_spcd = csc.ctlg_spcd where csc.ctlg_spcd='2'"
        tags => "cncr_spzn_ctlg_spcd_2"
    }
}
output {
    if "cncr_spzn_ctlg_spcd_1" in [tags] {
        elasticsearch {
            hosts => ["localhost:9200"]
            index => "cncr_spzn_ctlg_1"
            document_id => "%{ctlg_spcd}-%{hosp_seq}-%{arry_ord_vl}"
            #user => "elastic"
            #password => "changeme"
        }
    }
    else if "cncr_spzn_ctlg_spcd_2" in [tags] {
        elasticsearch {
            hosts => ["localhost:9200"]
            index => "cncr_spzn_ctlg_2"
            document_id => "%{ctlg_spcd}-%{hosp_seq}-%{arry_ord_vl}"
            #user => "elastic"
            #password => "changeme"
        }
    }
}

* Nori (한글 형태소 분석기)
템플릿 설정:
PUT http://198.18.227.37:9200/_template/nori_template
{
	"index_patterns": [
		"cncr_spzn_ctlg_1", "cncr_spzn_ctlg_2"
	],
	"order": 1,
	"settings": {
		"number_of_replicas": 1,
		"number_of_shards": 1,
		"index": {
			"analysis": {
				"tokenizer": {
					"nori_discard": {
						"type": "nori_tokenizer",
						"decompound_mode": "discard"
					}
				},
				"analyzer": {
					"nori_analyzer": {
						"tokenizer": "nori_discard"
					}
				}
			}
		}
	},    
	"mappings": {
		"properties": {
			"ctlg_kyw_cont": {
                "type": "text",
                "analyzer": "nori_analyzer",
                "fields": {
                    "keyword": {
                        "type": "keyword",
                        "ignore_above": 256
                    }
                }
            }
		}
	}
}