{{/*
Basename for events resources
{{ include "events.basename" . }}
*/}}
{{- define "events.basename" -}}
events-{{ include "basename" . }}
{{- end -}}

{{/*
Kubernetes standard labels for events
labels: {{ include "events.labels" . | nindent 4 }}
*/}}
{{- define "events.labels" -}}
{{ include "labels" . }}
app.kubernetes.io/component: events
app.kubernetes.io/version: {{ .Values.events.deployment.image.tag | quote }}
{{- end -}}

{{/*
Labels used to match events labels
selector: {{- include "events.matchLabels" . | nindent 4 }}
*/}}
{{- define "events.matchLabels" -}}
{{include "matchLabels" . }}
app.kubernetes.io/component: events
{{- end -}}

{{/*
Secret name
secretName: {{ template "events.secret" . }}
*/}}
{{- define "events.secret" -}}
{{- if .Values.events.secrets.existingSecret -}}
{{ .Values.events.secrets.existingSecret }}
{{- else -}}
{{ include "events.basename" . }}
{{- end -}}
{{- end -}}

{{/*
Pvc name
claimName: {{ template "events.pvc" . }}
*/}}
{{- define "events.pvc" -}}
{{- if .Values.events.persistence.existingPvc -}}
{{ .Values.events.persistence.existingPvc }}
{{- else -}}
{{ include "events.basename" . }}
{{- end -}}
{{- end -}}