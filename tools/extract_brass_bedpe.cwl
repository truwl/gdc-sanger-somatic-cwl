cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerPull: quay.io/ncigdc/gdc-sanger-somatic-tool:77c5c39604cf01ea445c3deb83d4b9d91e3cd43e
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
