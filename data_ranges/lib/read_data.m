function data = read_data(name)
    data_dir = "../../Data";
    drive_dir = data_dir + "/drive_data";
    test_dir = data_dir + "/test_cell_data";
    %% drive data
    if (name == "adt_15")
        data = load(drive_dir + "/ADTransport_150814/ADTransport_150814_Day_File.mat");
    elseif (name == "adt_17")
        data = load(drive_dir + "/ADTransport_170201/ADTransport_170201_dat_file.mat");
    elseif (name == "mes_15")
        data = load(drive_dir + "/MesillaValley_150605/MesillaValley_150605_day_file.mat");
    elseif (name == "mes_18")
        data = load(drive_dir + "/MesillaValley_180314/MesillaValley_180314_day_file.mat");
    elseif (name == "wer_15")
        data = load(drive_dir + "/Werner_151111/Werner_151111_day_file.mat");
    elseif (name == "wer_20")
        data = load(drive_dir + "/Werner_20171006/Werner_20171006_day_file.mat");
    elseif (name == "trw_15")
        data = load(drive_dir + "/Transwest_150325/Transwest_150325_day_file.mat");
    elseif (name == "trw_16")
        data = load(drive_dir + "/Transwest_161210/Transwest_161210_day_file.mat");
    %% test cell data
    elseif (name == "aged_cftp")
        data = readtable(test_dir + "/g580040_Aged_cFTP.csv");
    elseif (name == "aged_hftp")
        data = readtable(test_dir + "/g580041_Aged_hFTP.csv");
    elseif (name == "aged_rmc")
        data  = readtable(test_dir + "/g580043_Aged_RMC.csv");
    elseif (name == "dg_cftp")
        data = readtable(test_dir + "/g577670_DG_cFTP.csv");
    elseif (name == "dg_hftp")
        data = readtable(test_dir + "/g577671_DG_hFTP.csv");
    elseif (name == "dg_rmc")
        data = readtable(test_dir + "/g577673_DG_RMC.csv");
    else
        data = 0;
    end
end