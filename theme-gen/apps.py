from pathlib import Path
from dataclasses import dataclass


@dataclass(slots=True, frozen=True)
class Palette:
	background: str
	background_alt: str
	foreground: str
	foreground_alt: str
	tint: str
	tint_alt: str

	black: str
	red: str
	green: str
	yellow: str
	blue: str
	magenta: str
	cyan: str
	white: str


class AppPath:
	def __init__(self, name, config_path, parser, output_path = None):
		self._name = name
		self._config_path = Path(config_path)
		self._parser = parser
		self._output_path = Path(output_path) if output_path is not None else self._config_path

		assert self._validate()

	def _validate(self):
		return self._config_path.exists()

	def __repr__(self):
		return f"AppPath(name=\"{self._name}\", config=\"{self._config_path}\""

	def run(self, palette):
		with open(self._config_path, "r") as finput:
			txt = finput.read()

		altered_txt = self._parser(txt, palette)

		with open(self._output_path, "w+") as foutput:
			foutput.write(altered_txt)


