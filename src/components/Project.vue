<template>
  <div class="project">
    <div class="project-header">
      <h3>{{ header }}</h3>
    </div>
    <div class="project-metadata">
      {{ year }}
      <a
        :href="link"
        target="_blank"
        rel="noopener noreferrer"
        class="project-link"
      >
        [{{ linkText }}]
      </a>
    </div>
    <div class="project-description">
      {{ text }}
    </div>
  </div>
</template>

<script>
export default {
  props: ['header', 'year', 'text', 'link', 'linkText']
}
</script>
