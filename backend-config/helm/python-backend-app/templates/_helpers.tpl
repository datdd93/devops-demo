{{- define "python-backend-app.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "python-backend-app.fullname" -}}
{{- include "python-backend-app.name" . }}-{{ .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}