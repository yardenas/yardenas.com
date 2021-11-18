<template>
  <div class="projects">
    <main>
      <article>
        <h2>Projects</h2>
        <project
          v-for="project in projects"
          :key="project"
          :header="project.header"
          :text="project.text"
          :link="project.link"
          :linkText="project.linkText"
        />
      </article>
    </main>
  </div>
</template>

<script>
import projects from '@/projects.json'
import Project from '@/components/Project.vue'
export default {
  data () {
    return {
      projects: projects
    }
  },
  components: {
    Project
  }
}
</script>
