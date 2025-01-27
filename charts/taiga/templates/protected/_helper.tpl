{{/*
Basename for protected resources
{{ include "protected.basename" . }}
*/}}
{{- define "protected.basename" -}}
protected-{{ include "basename" . }}
{{- end -}}

{{/*
Kubernetes standard labels for protected
labels: {{ include "protected.labels" . | nindent 4 }}
*/}}
{{- define "protected.labels" -}}
{{ include "labels" . }}
app.kubernetes.io/component: protected
app.metaways.net/software: taiga
app.kubernetes.io/version: {{ .Values.protected.deployment.image.tag | default .Chart.AppVersion }}
{{- end -}}

{{/*
Labels used to match protected labels
selector: {{- include "protected.matchLabels" . | nindent 4 }}
*/}}
{{- define "protected.matchLabels" -}}
{{include "matchLabels" . }}
app.kubernetes.io/component: protected
{{- end -}}

{{/*
Secret name
secretName: {{ template "protected.secret" . }}
*/}}
{{- define "protected.secret" -}}
{{- if .Values.protected.secrets.existingSecret -}}
{{ .Values.protected.secrets.existingSecret }}
{{- else -}}
{{ include "protected.basename" . }}
{{- end -}}
{{- end -}}

{{/*
Pvc name
claimName: {{ template "protected.pvc" . }}
*/}}
{{- define "protected.pvc" -}}
{{- if .Values.protected.persistence.existingPvc -}}
{{ .Values.protected.persistence.existingPvc }}
{{- else -}}
{{ include "protected.basename" . }}
{{- end -}}
{{- end -}}