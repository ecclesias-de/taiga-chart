{{/*
Basename for front resources
{{ include "front.basename" . }}
*/}}
{{- define "front.basename" -}}
front-{{ include "basename" . }}
{{- end -}}

{{/*
Kubernetes standard labels for front
labels: {{ include "front.labels" . | nindent 4 }}
*/}}
{{- define "front.labels" -}}
{{ include "labels" . }}
app.kubernetes.io/component: front
app.kubernetes.io/version: {{ .Values.front.deployment.image.tag | quote }}
{{- end -}}

{{/*
Labels used to match front labels
selector: {{- include "front.matchLabels" . | nindent 4 }}
*/}}
{{- define "front.matchLabels" -}}
{{include "matchLabels" . }}
app.kubernetes.io/component: front
{{- end -}}

{{/*
Secret name
secretName: {{ template "front.secret" . }}
*/}}
{{- define "front.secret" -}}
{{- if .Values.front.secrets.existingSecret -}}
{{ .Values.front.secrets.existingSecret }}
{{- else -}}
{{ include "front.basename" . }}
{{- end -}}
{{- end -}}

{{/*
Pvc name
claimName: {{ template "front.pvc" . }}
*/}}
{{- define "front.pvc" -}}
{{- if .Values.front.persistence.existingPvc -}}
{{ .Values.front.persistence.existingPvc }}
{{- else -}}
{{ include "front.basename" . }}
{{- end -}}
{{- end -}}