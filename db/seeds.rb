# Load up the data from these bacteria with smaller genomes
#
# Example:
#
#     ftp://ftp.ncbi.nlm.nih.gov/genbank/genomes/Bacteria/Buchnera_aphidicola_Sg_uid312/AE013218.gbk


require "genome_import_task"

COMMON_PATH = "ftp://ftp.ncbi.nlm.nih.gov/genbank/genomes/Bacteria"

GenomeImportTask.new("#{COMMON_PATH}/Buchnera_aphidicola_Sg_uid312/AE013218.gbk").call
GenomeImportTask.new("#{COMMON_PATH}/Wigglesworthia_brevipalpis_uid274/BA000021.gbk").call
GenomeImportTask.new("#{COMMON_PATH}/Candidatus_Blochmannia_floridanus_uid443/BX248583.gbk").call
GenomeImportTask.new("#{COMMON_PATH}/Tropheryma_whipplei_Twist_uid95/AE014184.gbk").call
GenomeImportTask.new("#{COMMON_PATH}/Mycoplasma_pneumoniae_uid99/U00089.gbk").call
GenomeImportTask.new("#{COMMON_PATH}/Ureaplasma_parvum_serovar_3_ATCC_27815_uid19087/CP000942.gbk").call
GenomeImportTask.new("#{COMMON_PATH}/Onion_yellows_phytoplasma_uid9615/AP006628.gbk").call