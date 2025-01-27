{{/*
Basename for backend resources
{{ include "backend.basename" . }}
*/}}
{{- define "backend.basename" -}}
backend-{{ include "basename" . }}
{{- end -}}

{{/*
Kubernetes standard labels for backend
labels: {{ include "backend.labels" . | nindent 4 }}
*/}}
{{- define "backend.labels" -}}
{{ include "labels" . }}
app.kubernetes.io/component: backend
app.metaways.net/software: taiga
app.kubernetes.io/version: {{ .Values.backend.deployment.image.tag | default .Chart.AppVersion }}
{{- end -}}

{{/*
Labels used to match backend labels
selector: {{- include "backend.matchLabels" . | nindent 4 }}
*/}}
{{- define "backend.matchLabels" -}}
{{include "matchLabels" . }}
app.kubernetes.io/component: backend
{{- end -}}

{{/*
Secret name
secretName: {{ template "backend.secret" . }}
*/}}
{{- define "backend.secret" -}}
{{- if .Values.backend.secrets.existingSecret -}}
{{ .Values.backend.secrets.existingSecret }}
{{- else -}}
{{ include "backend.basename" . }}
{{- end -}}
{{- end -}}

{{/*
Pvc name
claimName: {{ template "backend.pvc" . }}
*/}}
{{- define "backend.pvc" -}}
{{- if .Values.backend.persistence.existingPvc -}}
{{ .Values.backend.persistence.existingPvc }}
{{- else -}}
{{ include "backend.basename" . }}
{{- end -}}
{{- end -}}