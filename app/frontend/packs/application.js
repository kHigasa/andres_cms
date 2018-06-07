import './styles/reset.css';
import './styles/theme.scss';
import './application.css';
import './pages/page.css';
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)
