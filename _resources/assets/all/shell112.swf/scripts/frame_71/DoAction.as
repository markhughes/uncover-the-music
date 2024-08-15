_level0.debug("Shell: Connect");
_level0.sStatus = "Opening connection...";
_level0._session.open(_level0._session.getIpAddress(),_level0._session.getPort());
stop();
