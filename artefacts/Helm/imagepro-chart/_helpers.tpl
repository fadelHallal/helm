{{- define "imagepro.fullname" -}}
{{ .Release.Name }}
{{- end }}

{{- define "imagepro.labels" -}}
app: {{ .Release.Name }}
{{- end }}
