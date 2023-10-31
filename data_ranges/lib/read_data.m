function data_struct = read_data()
    data_struct = struct;
    data_dir = "../../Data";
    %% drive data
    drive_dir = data_dir + "/drive_data";
    data_struct.drive.adt_15 = load(drive_dir + "/ADTransport_150814/ADTransport_150814_Day_File.mat");
    data_struct.drive.adt_17 = load(drive_dir + "/ADTransport_170201/ADTransport_170201_dat_file.mat");
    data_struct.drive.mes_15 = load(drive_dir + "/MesillaValley_150605/MesillaValley_150605_day_file.mat");
    data_struct.drive.mes_18 = load(drive_dir + "/MesillaValley_180314/MesillaValley_180314_day_file.mat");
    data_struct.drive.wer_15 = load(drive_dir + "/Werner_151111/Werner_151111_day_file.mat");
    data_struct.drive.wer_20 = load(drive_dir + "/Werner_20171006/Werner_20171006_day_file.mat");
    data_struct.drive.trw_15 = load(drive_dir + "/Transwest_150325/Transwest_150325_day_file.mat");
    data_struct.drive.trw_16 = load(drive_dir + "/Transwest_161210/Transwest_161210_day_file.mat");
    %% test cell data
    test_dir = data_dir + "/test_cell_data";
    data_struct.test.aged_cftp = readtable(test_dir + "/g580040_Aged_cFTP.csv");
    data_struct.test.aged_hftp = readtable(test_dir + "/g580041_Aged_hFTP.csv");
    data_struct.test.aged_rmc  = readtable(test_dir + "/g580043_Aged_RMC.csv");
    data_struct.test.dg_cftp   = readtable(test_dir + "/g577670_DG_cFTP.csv");
    data_struct.test.dg_hftp   = readtable(test_dir + "/g577671_DG_hFTP.csv");
    data_struct.test.dg_rmc    = readtable(test_dir + "/g577673_DG_RMC.csv");
end