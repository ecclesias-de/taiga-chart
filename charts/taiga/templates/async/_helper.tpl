{{/*
Basename for async resources
{{ include "async.basename" . }}
*/}}
{{- define "async.basename" -}}
async-{{ include "basename" . }}
{{- end -}}

{{/*
Kubernetes standard labels for async
labels: {{ include "async.labels" . | nindent 4 }}
*/}}
{{- define "async.labels" -}}
{{ include "labels" . }}
app.kubernetes.io/component: async
app.metaways.net/software: taiga
app.kubernetes.io/version: {{ .Values.backend.deployment.image.tag | default .Chart.AppVersion }}
{{- end -}}

{{/*
Labels used to match async labels
selector: {{- include "async.matchLabels" . | nindent 4 }}
*/}}
{{- define "async.matchLabels" -}}
{{include "matchLabels" . }}
app.kubernetes.io/component: async
{{- end -}}

{{/*
Secret name
secretName: {{ template "async.secret" . }}
*/}}
{{- define "async.secret" -}}
{{- if .Values.async.secrets.existingSecret -}}
{{ .Values.async.secrets.existingSecret }}
{{- else -}}
{{ include "async.basename" . }}
{{- end -}}
{{- end -}}

{{/*
Pvc name
claimName: {{ template "async.pvc" . }}
*/}}
{{- define "async.pvc" -}}
{{- if .Values.async.persistence.existingPvc -}}
{{ .Values.async.persistence.existingPvc }}
{{- else -}}
{{ include "async.basename" . }}
{{- end -}}
{{- end -}}