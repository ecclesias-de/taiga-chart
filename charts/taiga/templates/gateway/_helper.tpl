{{/*
Basename for gateway resources
{{ include "gateway.basename" . }}
*/}}
{{- define "gateway.basename" -}}
gateway-{{ include "basename" . }}
{{- end -}}

{{/*
Kubernetes standard labels for gateway
labels: {{ include "gateway.labels" . | nindent 4 }}
*/}}
{{- define "gateway.labels" -}}
{{ include "labels" . }}
app.kubernetes.io/component: gateway
app.kubernetes.io/version: {{ .Values.gateway.deployment.image.tag | quote }}
{{- end -}}

{{/*
Labels used to match gateway labels
selector: {{- include "gateway.matchLabels" . | nindent 4 }}
*/}}
{{- define "gateway.matchLabels" -}}
{{include "matchLabels" . }}
app.kubernetes.io/component: gateway
{{- end -}}

{{/*
Secret name
secretName: {{ template "gateway.secret" . }}
*/}}
{{- define "gateway.secret" -}}
{{- if .Values.gateway.secrets.existingSecret -}}
{{ .Values.gateway.secrets.existingSecret }}
{{- else -}}
{{ include "gateway.basename" . }}
{{- end -}}
{{- end -}}

{{/*
Pvc name
claimName: {{ template "gateway.pvc" . }}
*/}}
{{- define "gateway.pvc" -}}
{{- if .Values.gateway.persistence.existingPvc -}}
{{ .Values.gateway.persistence.existingPvc }}
{{- else -}}
{{ include "gateway.basename" . }}
{{- end -}}
{{- end -}}