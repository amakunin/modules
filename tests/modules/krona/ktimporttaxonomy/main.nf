#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { KRONA_KTIMPORTTAXONOMY as KRONA_TAXONOMY_READS  } from '../../../../modules/krona/ktimporttaxonomy/main.nf'
include { KRONA_KTIMPORTTAXONOMY as KRONA_TAXONOMY_REPORT } from '../../../../modules/krona/ktimporttaxonomy/main.nf'

workflow test_krona_ktimporttaxonomy_reads {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['metagenome']['classified_reads_assignment'], checkIfExists: true)
    ]
    taxonomy = file("https://raw.githubusercontent.com/lescai/test-datasets/modules/data/genomics/sarscov2/metagenome/krona_taxonomy.tab")

    KRONA_TAXONOMY_READS ( input, taxonomy )
}

workflow test_krona_ktimporttaxonomy_report {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['metagenome']['kraken_report'], checkIfExists: true)
    ]
    taxonomy = file("https://raw.githubusercontent.com/lescai/test-datasets/modules/data/genomics/sarscov2/metagenome/krona_taxonomy.tab")

    KRONA_TAXONOMY_REPORT ( input, taxonomy )
}
