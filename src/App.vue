<template>
  <header class="top-bar">
    <router-link to="/" class="title">
      <h1 @click="onNameMouseClick()">Yarden As</h1>
    </router-link>
    <a
      href="https://youtu.be/Ze5kqsHfL9s"
      target="_blank"
      rel="noopener noreferrer"
    >
      <img
        src="@/assets/logo.jpg"
        alt="A cool picture of Yarden As"
        class="cropped"
      />
    </a>
    <nav class="top-bar-nav">
      <ul>
        <li
          v-bind:style="styles.home"
          @mouseout="onMouseOut('home')"
          @mouseover="onMouseOver('home')"
          @click="onMouseClick('home')"
        >
          <router-link to="/" class="top-bar-link">
            <span>Home</span>
          </router-link>
        </li>
        <li
          v-bind:style="styles.projects"
          @mouseout="onMouseOut('projects')"
          @mouseover="onMouseOver('projects')"
          @click="onMouseClick('projects')"
        >
          <router-link to="/projects" class="top-bar-link">
            <span>Projects</span>
          </router-link>
        </li>
        <li
          v-bind:style="styles.places"
          @mouseout="onMouseOut('places')"
          @mouseover="onMouseOver('places')"
          @click="onMouseClick('places')"
        >
          <router-link to="/places" class="top-bar-link">
            <span>Locations</span>
          </router-link>
        </li>
        <li
          v-bind:style="styles.resume"
          @mouseout="onMouseOut('resume')"
          @mouseover="onMouseOver('resume')"
        >
          <a
            href="pdf/yarden-as-2021.pdf"
            target="_blank"
            rel="noopener noreferrer"
            class="top-bar-link"
          >
            <span>R&eacute;sum&eacute;</span>
          </a>
        </li>
      </ul>
    </nav>
  </header>
  <router-view />
</template>

<script>
const TRANSPARENT = '#11ffee00'
const COOL_RED = '#ff585d'
const COOL_BLUE = '#48a9c5'
const COOL_GREEN = '#00af6e'
const COOL_YELLOW = '#ffcd00'
const COLORS = [COOL_RED, COOL_YELLOW, COOL_GREEN, COOL_BLUE]

export default {
  data () {
    const currentPage = window.location.pathname.slice(1) || 'home'
    return {
      ptr: 0,
      activePage: currentPage,
      styles: {
        home: {
          backgroundColor: currentPage === 'home' ? COOL_YELLOW : TRANSPARENT
        },
        projects: {
          backgroundColor:
            currentPage === 'projects' ? COOL_YELLOW : TRANSPARENT
        },
        places: {
          backgroundColor: currentPage === 'places' ? COOL_YELLOW : TRANSPARENT
        },
        resume: {
          backgroundColor: TRANSPARENT
        }
      }
    }
  },
  methods: {
    onMouseOut (name) {
      if (name !== this.activePage) {
        this.styles[name].backgroundColor = TRANSPARENT
      }
      this.incrementPtr()
      if (COLORS[this.ptr] === this.styles[this.activePage].backgroundColor) {
        this.incrementPtr()
      }
    },
    onMouseOver (name) {
      if (name !== this.activePage) {
        this.styles[name].backgroundColor = COLORS[this.ptr]
      }
    },
    onMouseClick (name) {
      if (name !== this.activePage) {
        this.styles[this.activePage].backgroundColor = TRANSPARENT
      }
      this.activePage = name
    },
    onNameMouseClick () {
      this.onMouseClick('home')
      this.styles.home.backgroundColor = COLORS[this.ptr]
    },
    incrementPtr () {
      this.ptr = (this.ptr + 1) % COLORS.length
    }
  }
}
</script>
