#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { ANOSPPQC } from '../../../../modules/nf-core/anosppqc/main.nf'

workflow test_anosppqc {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file("/lustre/scratch126/tol/teams/lawniczak/users/am60/nfanospp_dev/test_data_qc/haplotypes.tsv", checkIfExists: true),
        file("/lustre/scratch126/tol/teams/lawniczak/users/am60/nfanospp_dev/test_data_qc/samples.csv", checkIfExists: true),
        file("/lustre/scratch126/tol/teams/lawniczak/users/am60/nfanospp_dev/test_data_qc/stats.tsv", checkIfExists: true)
    ]

    ANOSPPQC ( input )
}
