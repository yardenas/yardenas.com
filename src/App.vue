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
          @mouseout="onMouseOut('home')"
          @mouseover="onMouseOver('home')"
          @click="onMouseClick('home')"
        >
          <router-link to="/" class="top-bar-link">
            <span v-bind:style="styles.home">Home</span>
          </router-link>
        </li>
        <li
          @mouseout="onMouseOut('projects')"
          @mouseover="onMouseOver('projects')"
          @click="onMouseClick('projects')"
        >
          <router-link to="/projects" class="top-bar-link">
            <span v-bind:style="styles.projects">Projects</span>
          </router-link>
        </li>
        <li
          @mouseout="onMouseOut('places')"
          @mouseover="onMouseOver('places')"
          @click="onMouseClick('places')"
        >
          <router-link to="/places" class="top-bar-link">
            <span v-bind:style="styles.places">Locations</span>
          </router-link>
        </li>
        <li
          @mouseout="onMouseOut('resume')"
          @mouseover="onMouseOver('resume')"
        >
          <a
            href="pdf/yarden-as-2021.pdf"
            target="_blank"
            rel="noopener noreferrer"
            class="top-bar-link"
          >
            <span v-bind:style="styles.resume">R&eacute;sum&eacute;</span>
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
    const paths = window.location.pathname.split('/')
    const currentPage = paths[paths.length - 1] || 'home'
    return {
      ptr: 0,
      activePage: currentPage,
      styles: {
        home: {
          'border-bottom-color':
            currentPage === 'home' ? COOL_YELLOW : TRANSPARENT
        },
        projects: {
          'border-bottom-color':
            currentPage === 'projects' ? COOL_YELLOW : TRANSPARENT
        },
        places: {
          'border-bottom-color':
            currentPage === 'places' ? COOL_YELLOW : TRANSPARENT
        },
        resume: {
          'border-bottom-color': TRANSPARENT
        }
      }
    }
  },
  methods: {
    onMouseOut (name) {
      if (name !== this.activePage) {
        this.styles[name]['border-bottom-color'] = TRANSPARENT
      }
      this.incrementPtr()
      if (
        COLORS[this.ptr] === this.styles[this.activePage]['border-bottom-color']
      ) {
        this.incrementPtr()
      }
    },
    onMouseOver (name) {
      if (name !== this.activePage) {
        this.styles[name]['border-bottom-color'] = COLORS[this.ptr]
      }
    },
    onMouseClick (name) {
      if (name !== this.activePage) {
        this.styles[this.activePage]['border-bottom-color'] = TRANSPARENT
      }
      this.activePage = name
    },
    onNameMouseClick () {
      this.onMouseClick('home')
      this.styles.home['border-bottom-color'] = COLORS[this.ptr]
    },
    incrementPtr () {
      this.ptr = (this.ptr + 1) % COLORS.length
    }
  }
}
</script>
