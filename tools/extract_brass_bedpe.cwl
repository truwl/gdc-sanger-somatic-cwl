cwlVersion: v1.0
class: CommandLineTool
id: extract_brass_bedpe
requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerPull: quay.io/ncigdc/gdc-sanger-somatic-tool:a89360b5734091928943ebce7044d4ee75c64e91
  - class: ResourceRequirement
    coresMin: 1
    ramMin: 1000

inputs:
  archive:
    type: File
    inputBinding:
      prefix: --results_archive

  output_prefix:
    type: string
    inputBinding:
      prefix: --output_prefix

outputs:
  brass_bedpe:
    type: File
    outputBinding:
      glob: $(inputs.output_prefix + '.bedpe.gz')

  brass_bedpe_index:
    type: File
    outputBinding:
      glob: $(inputs.output_prefix + '.bedpe.gz.tbi')

baseCommand: [python, /opt/extract_brass_bedpe.py]
