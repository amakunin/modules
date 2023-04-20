#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { ANOSPPPREP } from '../../../../modules/nf-core/anosppprep/main.nf'

workflow test_anosppprep {
    
    input = [
        [ id:'test'], // meta map
        file("/lustre/scratch126/tol/teams/lawniczak/users/am60/anospp-ampliseq-240/38081/ampliseq/dada2/DADA2_table.tsv", checkIfExists: true),
        file("/lustre/scratch126/tol/teams/lawniczak/users/am60/nfanospp_dev/adapters.fa", checkIfExists: true),
    ]

    ANOSPPPREP ( input )
}
