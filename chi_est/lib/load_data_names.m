function dat_names = load_data_names()
    dat_names = struct;
    dat_names.trk = ["adt_15"
              "adt_17"
              "mes_15"
              "mes_18"
              "wer_15"
              "wer_20"
              "trw_15"
              "trw_16"];
    dat_names.tc = ["aged_cftp"   
              "aged_hftp"
              "aged_rmc"
              "dg_cftp"
              "dg_hftp"
              "dg_rmc"];
end